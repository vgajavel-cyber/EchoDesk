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
@Table(name = "delinquency_case")
public class DelinquencyCase {

    public enum Status { OPEN, PROMISE_MADE, PAID, BROKEN_PROMISE, LEGAL, CLOSED }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "lease_id", nullable = false)
    private UUID leaseId;

    @Column(name = "call_id")
    private UUID callId;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal amountOwed;

    @Column(nullable = false)
    private int daysLate;

    private LocalDate promiseToPayOn;

    @Column(precision = 10, scale = 2)
    private BigDecimal promisedAmount;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status = Status.OPEN;

    @Column(nullable = false, updatable = false)
    private Instant createdAt = Instant.now();

    public UUID getId() { return id; }
    public UUID getLeaseId() { return leaseId; }
    public void setLeaseId(UUID leaseId) { this.leaseId = leaseId; }
    public UUID getCallId() { return callId; }
    public void setCallId(UUID callId) { this.callId = callId; }
    public BigDecimal getAmountOwed() { return amountOwed; }
    public void setAmountOwed(BigDecimal amountOwed) { this.amountOwed = amountOwed; }
    public int getDaysLate() { return daysLate; }
    public void setDaysLate(int daysLate) { this.daysLate = daysLate; }
    public LocalDate getPromiseToPayOn() { return promiseToPayOn; }
    public void setPromiseToPayOn(LocalDate promiseToPayOn) { this.promiseToPayOn = promiseToPayOn; }
    public BigDecimal getPromisedAmount() { return promisedAmount; }
    public void setPromisedAmount(BigDecimal promisedAmount) { this.promisedAmount = promisedAmount; }
    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }
    public Instant getCreatedAt() { return createdAt; }
}