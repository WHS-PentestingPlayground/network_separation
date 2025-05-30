package com.example.api.service;

import com.example.api.model.FileEntity;
import com.example.api.repository.FileRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileService {

    private final FileRepository fileRepository;

    // 파일 저장 디렉토리
    private static final String UPLOAD_DIR = "/uploads";

    // 파일 업로드 처리
    public FileEntity saveFile(MultipartFile file, String userId) throws IOException {
        // 고유한 파일명 생성
        String originalFilename = file.getOriginalFilename();
        String storedFilename = UUID.randomUUID() + "_" + originalFilename;

        // 저장 경로
        File saveDir = new File(UPLOAD_DIR);
        if (!saveDir.exists()) saveDir.mkdirs();

        File dest = new File(saveDir, storedFilename);
        file.transferTo(dest);

        // DB에 메타데이터 저장
        FileEntity entity = FileEntity.builder()
                .filename(originalFilename)
                .storedName(storedFilename)
        uploadedBy(userId)
                .uploadedAt(LocalDateTime.now())
                .build();

        return fileRepository.save(entity);
    }

    // 모든 파일 조회
    public List<FileEntity> findAll() {
        return fileRepository.findAll();
    }

    // ID로 파일 조회
    public Optional<FileEntity> findById(Long id) {
        return fileRepository.findById(id);
    }

    // 파일 삭제
    public void deleteFile(Long id) {
        fileRepository.findById(id).ifPresent(file -> {
            // 실제 파일 삭제
            File stored = new File(UPLOAD_DIR, file.getStoredName());
            if (stored.exists()) stored.delete();

            // DB에서 삭제
            fileRepository.delete(file);
        });
    }
}
