package com.example.api.repository;

import com.example.api.entity.FileEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepository extends JpaRepository<FileEntity, Long> {
    // 기본적인 CRUD 메서드는 JpaRepository가 제공
}
