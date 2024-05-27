package com.youpassed.mapper;

import com.youpassed.domain.Exam;
import com.youpassed.domain.Major;
import com.youpassed.domain.Role;
import com.youpassed.domain.User;
import com.youpassed.entity.ExamEntity;
import com.youpassed.entity.MajorEntity;
import com.youpassed.entity.StudentMajorEntity;
import com.youpassed.entity.StudentMajorPK;
import com.youpassed.entity.StudentMarkEntity;
import com.youpassed.entity.StudentMarkPK;
import com.youpassed.entity.UserEntity;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.stream.Collectors;

@Component
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class UserMapper implements Mapper<UserEntity, User> {
	private Mapper<MajorEntity, Major> majorMapper;
	private Mapper<ExamEntity, Exam> examMapper;

	@Override
	public UserEntity mapDomainToEntity(User user) {
		return user == null ? null :
				UserEntity.builder()
						.id(user.getId())
						.email(user.getEmail())
						.password(user.getPassword())
						.role(getUserEntityRoleNullSafe(user))
						.firstName(user.getFirstName())
						.lastName(user.getLastName())
						.build();
	}

	public UserEntity mapDomainToEntityWithLists(User user) {
		UserEntity userEntity = mapDomainToEntity(user);

		if (userEntity != null) {
			userEntity.setStudMajors(user.getMajors().stream()
					.map(major -> {
						StudentMajorEntity studMajor = new StudentMajorEntity();
						StudentMajorPK pk = new StudentMajorPK();
						pk.setMajorId(major.getId());
						pk.setStudentId(userEntity.getId());
						studMajor.setPk(pk);
						studMajor.setMajor(majorMapper.mapDomainToEntity(major));
						studMajor.setStudent(userEntity);
						studMajor.setYouPassed(major.isYouPassed());
						return studMajor;
					}).collect(Collectors.toList()));

			userEntity.setMarks(user.getExams().stream()
					.map(exam -> {
						StudentMarkEntity mark = new StudentMarkEntity();
						StudentMarkPK pk = new StudentMarkPK();
						pk.setExamId(exam.getId());
						pk.setStudentId(userEntity.getId());
						mark.setPk(pk);
						mark.setExam(examMapper.mapDomainToEntity(exam));
						mark.setStudent(userEntity);
						mark.setMark(exam.getMark());
						return mark;
					}).collect(Collectors.toList()));
		}

		return userEntity;
	}

	@Override
	public User mapEntityToDomain(UserEntity entity) {
		return entity == null ? null :
				User.builder()
						.id(entity.getId())
						.email(entity.getEmail())
						.password(entity.getPassword())
						.password2(entity.getPassword())
						.role(getUserRoleNullSafe(entity))
						.firstName(entity.getFirstName())
						.lastName(entity.getLastName())
						.build();
	}

	public User mapEntityToDomainWithLists(UserEntity entity) {
		User user = mapEntityToDomain(entity);

		if (user != null) {
			user.setMajors(entity.getStudMajors().stream()
					.map(studMajor -> {
						Major major = majorMapper.mapEntityToDomain(studMajor.getMajor());
						major.setApplied(true);
						major.setYouPassed(studMajor.isYouPassed());
						return major;
					}).collect(Collectors.toList()));

			user.setExams(entity.getMarks().stream()
					.map(mark -> {
						Exam exam = examMapper.mapEntityToDomain(mark.getExam());
						exam.setRegistered(true);
						exam.setMark(mark.getMark());
						return exam;
					}).collect(Collectors.toList()));
		}

		return user;
	}

	private com.youpassed.entity.Role getUserEntityRoleNullSafe(User user) {
		Optional<Role> userRole = Optional.ofNullable(user.getRole());
		return userRole.map(role -> com.youpassed.entity.Role.valueOf(role.name())).orElse(null);
	}

	private Role getUserRoleNullSafe(UserEntity entity) {
		Optional<com.youpassed.entity.Role> userEntityRole = Optional.ofNullable(entity.getRole());
		return userEntityRole.map(role -> Role.valueOf(role.name())).orElse(null);
	}
}
