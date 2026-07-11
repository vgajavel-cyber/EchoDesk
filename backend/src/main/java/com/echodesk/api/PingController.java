package com.echodesk.api;

import java.time.Instant;
import java.util.Map;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
public class PingController {
    @GetMapping("/ping")
    public Map<String, Object> ping() {
        return Map.of("service", "echodesk-api", "status", "ok", "time", Instant.now().toString());
    }
}