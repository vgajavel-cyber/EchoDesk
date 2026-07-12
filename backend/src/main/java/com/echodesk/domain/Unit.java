package com.echodesk.domain;

import java.math.BigDecimal;
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
@Table(name = "unit")
public class Unit {

    public enum Status { VACANT, OCCUPIED, NOTICE, MAKE_READY, DOWN }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "property_id", nullable = false)
    private UUID propertyId;

    @Column(nullable = false, length = 20)
    private String unitNumber;

    @Column(nullable = false)
    private int bedrooms;

    @Column(nullable = false, precision = 3, scale = 1)
    private BigDecimal bathrooms;

    private Integer sqft;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal marketRent;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status = Status.OCCUPIED;

    private LocalDate availableOn;

    public UUID getId() { return id; }
    public UUID getPropertyId() { return propertyId; }
    public void setPropertyId(UUID propertyId) { this.propertyId = propertyId; }
    public String getUnitNumber() { return unitNumber; }
    public void setUnitNumber(String unitNumber) { this.unitNumber = unitNumber; }
    public int getBedrooms() { return bedrooms; }
    public void setBedrooms(int bedrooms) { this.bedrooms = bedrooms; }
    public BigDecimal getBathrooms() { return bathrooms; }
    public void setBathrooms(BigDecimal bathrooms) { this.bathrooms = bathrooms; }
    public Integer getSqft() { return sqft; }
    public void setSqft(Integer sqft) { this.sqft = sqft; }
    public BigDecimal getMarketRent() { return marketRent; }
    public void setMarketRent(BigDecimal marketRent) { this.marketRent = marketRent; }
    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }
    public LocalDate getAvailableOn() { return availableOn; }
    public void setAvailableOn(LocalDate availableOn) { this.availableOn = availableOn; }
}