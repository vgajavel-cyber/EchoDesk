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
@Table(name = "voice_agent")
public class VoiceAgent {

    public enum Module { LEASING, MAINTENANCE, RENEWALS, DELINQUENCY, GENERAL }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "property_id", nullable = false)
    private UUID propertyId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Module module;

    @Column(name = "retell_agent_id")
    private String retellAgentId;

    private String phoneNumber;

    @Column(name = "voice_name", nullable = false)
    private String voiceName = "nova";

    @Column(columnDefinition = "text")
    private String systemPrompt;

    @Column(nullable = false)
    private boolean isActive = true;

    public UUID getId() { return id; }
    public UUID getPropertyId() { return propertyId; }
    public void setPropertyId(UUID propertyId) { this.propertyId = propertyId; }
    public Module getModule() { return module; }
    public void setModule(Module module) { this.module = module; }
    public String getRetellAgentId() { return retellAgentId; }
    public void setRetellAgentId(String retellAgentId) { this.retellAgentId = retellAgentId; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public String getVoiceName() { return voiceName; }
    public void setVoiceName(String voiceName) { this.voiceName = voiceName; }
    public String getSystemPrompt() { return systemPrompt; }
    public void setSystemPrompt(String systemPrompt) { this.systemPrompt = systemPrompt; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
}