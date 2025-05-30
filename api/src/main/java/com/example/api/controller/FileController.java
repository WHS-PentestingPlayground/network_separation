package com.example.api.controller;

import com.example.api.model.FileEntity;
import com.example.api.service.FileService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.util.List;

@RestController
@RequestMapping("/api/files")
@RequiredArgsConstructor
public class FileController {

    private final FileService fileService;

    // 🔼 파일 업로드
    @PostMapping("/upload")
    public ResponseEntity<FileEntity> uploadFile(@RequestParam("file") MultipartFile file,
                                                 @RequestParam("userId") String userId) {
        try {
            FileEntity saved = fileService.saveFile(file, userId);
            return ResponseEntity.ok(saved);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // 📋 파일 목록 조회
    @GetMapping("/list")
    public ResponseEntity<List<FileEntity>> listFiles() {
        return ResponseEntity.ok(fileService.findAll());
    }

    // ⬇️ 파일 다운로드
    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
        return fileService.findById(id)
                .map(file -> {
                    File stored = new File("/uploads", file.getStoredName());
                    try {
                        byte[] content = Files.readAllBytes(stored.toPath());
                        HttpHeaders headers = new HttpHeaders();
                        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                        headers.setContentDisposition(ContentDisposition
                                .attachment()
                                .filename(file.getFilename())
                                .build());

                        return new ResponseEntity<>(content, headers, HttpStatus.OK);
                    } catch (IOException e) {
                        return new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
                    }
                })
                .orElse(ResponseEntity.notFound().build());
    }

    // 🗑️ 파일 삭제
//    @DeleteMapping("/delete/{id}")
//    public ResponseEntity<Void> deleteFile(@PathVariable Long id) {
//        fileService.deleteFile(id);
//        return ResponseEntity.ok().build();
//    }
}
