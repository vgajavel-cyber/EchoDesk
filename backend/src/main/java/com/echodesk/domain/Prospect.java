package com.echodesk.domain;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "prospect")
public class Prospect {

    public enum Status { NEW, CONTACTED, TOUR_SCHEDULED, TOURED, APPLIED, LEASED, LOST }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "property_id", nullable = false)
    private UUID propertyId;

    @Column(nullable = false)
    private String fullName;

    private String email;
    private String phone;

    private Integer desiredBeds;
    private LocalDate desiredMoveIn;

    @Column(precision = 10, scale = 2)
    private BigDecimal maxBudget;

    @Column(nullable = false)
    private String source = "PHONE";

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status = Status.NEW;

    @Column(nullable = false, updatable = false)
    private Instant createdAt = Instant.now();

    public UUID getId() { return id; }
    public UUID getPropertyId() { return propertyId; }
    public void setPropertyId(UUID propertyId) { this.propertyId = propertyId; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public Integer getDesiredBeds() { return desiredBeds; }
    public void setDesiredBeds(Integer desiredBeds) { this.desiredBeds = desiredBeds; }
    public LocalDate getDesiredMoveIn() { return desiredMoveIn; }
    public void setDesiredMoveIn(LocalDate desiredMoveIn) { this.desiredMoveIn = desiredMoveIn; }
    public BigDecimal getMaxBudget() { return maxBudget; }
    public void setMaxBudget(BigDecimal maxBudget) { this.maxBudget = maxBudget; }
    public String getSource() { return source; }
    public void setSource(String source) { this.source = source; }
    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }
    public Instant getCreatedAt() { return createdAt; }
}