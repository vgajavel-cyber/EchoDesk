package com.echodesk.domain;

import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "call_transcript_segment")
public class CallTranscriptSegment {

    public enum Speaker { AGENT, CALLER }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "call_id", nullable = false)
    private UUID callId;

    @Column(nullable = false)
    private int seq;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Speaker speaker;

    @Column(nullable = false, columnDefinition = "text")
    private String content;

    private Integer offsetMs;

    public UUID getId() { return id; }
    public UUID getCallId() { return callId; }
    public void setCallId(UUID callId) { this.callId = callId; }
    public int getSeq() { return seq; }
    public void setSeq(int seq) { this.seq = seq; }
    public Speaker getSpeaker() { return speaker; }
    public void setSpeaker(Speaker speaker) { this.speaker = speaker; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Integer getOffsetMs() { return offsetMs; }
    public void setOffsetMs(Integer offsetMs) { this.offsetMs = offsetMs; }
}