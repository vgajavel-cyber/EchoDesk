package com.echodesk.domain;

import java.time.Instant;
import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "call")
public class Call {

    public enum Direction { INBOUND, OUTBOUND }
    public enum Module { LEASING, MAINTENANCE, RENEWALS, DELINQUENCY, GENERAL }
    public enum Outcome { RESOLVED, TOUR_BOOKED, WORK_ORDER_CREATED, PAYMENT_PROMISED,
                          RENEWAL_ACCEPTED, ESCALATED, VOICEMAIL, HANGUP, TRANSFERRED }
    public enum Sentiment { POSITIVE, NEUTRAL, NEGATIVE }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "property_id", nullable = false)
    private UUID propertyId;

    @Column(name = "voice_agent_id")
    private UUID voiceAgentId;

    @Column(name = "resident_id")
    private UUID residentId;

    @Column(name = "prospect_id")
    private UUID prospectId;

    @Column(name = "retell_call_id", unique = true)
    private String retellCallId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Direction direction = Direction.INBOUND;

    private String callerNumber;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Module module = Module.GENERAL;

    @Column(nullable = false)
    private Instant startedAt = Instant.now();

    private Instant endedAt;

    private Integer durationSeconds;

    @Enumerated(EnumType.STRING)
    private Outcome outcome;

    @Enumerated(EnumType.STRING)
    private Sentiment sentiment;

    @Column(columnDefinition = "text")
    private String summary;

    private String recordingUrl;

    public UUID getId() { return id; }
    public UUID getPropertyId() { return propertyId; }
    public void setPropertyId(UUID propertyId) { this.propertyId = propertyId; }
    public UUID getVoiceAgentId() { return voiceAgentId; }
    public void setVoiceAgentId(UUID voiceAgentId) { this.voiceAgentId = voiceAgentId; }
    public UUID getResidentId() { return residentId; }
    public void setResidentId(UUID residentId) { this.residentId = residentId; }
    public UUID getProspectId() { return prospectId; }
    public void setProspectId(UUID prospectId) { this.prospectId = prospectId; }
    public String getRetellCallId() { return retellCallId; }
    public void setRetellCallId(String retellCallId) { this.retellCallId = retellCallId; }
    public Direction getDirection() { return direction; }
    public void setDirection(Direction direction) { this.direction = direction; }
    public String getCallerNumber() { return callerNumber; }
    public void setCallerNumber(String callerNumber) { this.callerNumber = callerNumber; }
    public Module getModule() { return module; }
    public void setModule(Module module) { this.module = module; }
    public Instant getStartedAt() { return startedAt; }
    public void setStartedAt(Instant startedAt) { this.startedAt = startedAt; }
    public Instant getEndedAt() { return endedAt; }
    public void setEndedAt(Instant endedAt) { this.endedAt = endedAt; }
    public Integer getDurationSeconds() { return durationSeconds; }
    public void setDurationSeconds(Integer durationSeconds) { this.durationSeconds = durationSeconds; }
    public Outcome getOutcome() { return outcome; }
    public void setOutcome(Outcome outcome) { this.outcome = outcome; }
    public Sentiment getSentiment() { return sentiment; }
    public void setSentiment(Sentiment sentiment) { this.sentiment = sentiment; }
    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }
    public String getRecordingUrl() { return recordingUrl; }
    public void setRecordingUrl(String recordingUrl) { this.recordingUrl = recordingUrl; }
}