package com.youpassed.repository;

import com.youpassed.entity.MajorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MajorRepository extends JpaRepository<MajorEntity, Integer> {
}
