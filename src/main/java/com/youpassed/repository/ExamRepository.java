package com.youpassed.repository;

import com.youpassed.entity.ExamEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExamRepository extends JpaRepository<ExamEntity, Integer> {
}
