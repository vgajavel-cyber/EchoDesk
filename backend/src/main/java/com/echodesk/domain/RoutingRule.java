package com.echodesk.domain;

import java.util.UUID;

import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "routing_rule")
public class RoutingRule {

    public enum Module { LEASING, MAINTENANCE, RENEWALS, DELINQUENCY, GENERAL }
    public enum Action { HANDLE_WITH_AI, TRANSFER_TO_STAFF, TAKE_MESSAGE, ESCALATE }

    @Id
    @GeneratedValue
    private UUID id;

    @Column(name = "property_id", nullable = false)
    private UUID propertyId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Module module;

    @Column(name = "trigger_keyword")
    private String triggerKeyword;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "condition_json", columnDefinition = "jsonb")
    private String conditionJson;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Action action;

    @Column(name = "transfer_target")
    private UUID transferTarget;

    @Column(nullable = false)
    private int priority = 100;

    @Column(nullable = false)
    private boolean isActive = true;

    public UUID getId() { return id; }
    public UUID getPropertyId() { return propertyId; }
    public void setPropertyId(UUID propertyId) { this.propertyId = propertyId; }
    public Module getModule() { return module; }
    public void setModule(Module module) { this.module = module; }
    public String getTriggerKeyword() { return triggerKeyword; }
    public void setTriggerKeyword(String triggerKeyword) { this.triggerKeyword = triggerKeyword; }
    public String getConditionJson() { return conditionJson; }
    public void setConditionJson(String conditionJson) { this.conditionJson = conditionJson; }
    public Action getAction() { return action; }
    public void setAction(Action action) { this.action = action; }
    public UUID getTransferTarget() { return transferTarget; }
    public void setTransferTarget(UUID transferTarget) { this.transferTarget = transferTarget; }
    public int getPriority() { return priority; }
    public void setPriority(int priority) { this.priority = priority; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
}