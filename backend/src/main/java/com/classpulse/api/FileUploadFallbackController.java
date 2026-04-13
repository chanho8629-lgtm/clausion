package com.classpulse.api;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import software.amazon.awssdk.services.s3.S3Client;

import java.util.Map;

/**
 * S3가 설정되지 않았을 때 파일 업로드 요청에 대한 fallback.
 */
@RestController
@RequestMapping("/api/files")
@ConditionalOnMissingBean(S3Client.class)
public class FileUploadFallbackController {

    @PostMapping("/upload")
    public ResponseEntity<Map<String, String>> upload() {
        return ResponseEntity.status(503)
                .body(Map.of("error", "파일 업로드 서비스가 설정되지 않았습니다. 관리자에게 문의하세요."));
    }

    @GetMapping("/download-url")
    public ResponseEntity<Map<String, String>> download() {
        return ResponseEntity.status(503)
                .body(Map.of("error", "파일 다운로드 서비스가 설정되지 않았습니다."));
    }
}
