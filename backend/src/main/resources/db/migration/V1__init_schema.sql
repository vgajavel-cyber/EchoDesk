-- EchoDesk V1: core schema (17 entities)

-- ========== ORG ==========

CREATE TABLE management_company (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(255) NOT NULL,
    contact_email   VARCHAR(255),
    contact_phone   VARCHAR(30),
    timezone        VARCHAR(60) NOT NULL DEFAULT 'America/Phoenix',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE staff_user (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id      UUID NOT NULL REFERENCES management_company(id),
    full_name       VARCHAR(255) NOT NULL,
    email           VARCHAR(255) NOT NULL UNIQUE,
    phone           VARCHAR(30),
    role            VARCHAR(30) NOT NULL DEFAULT 'AGENT'
                    CHECK (role IN ('ADMIN','MANAGER','AGENT','MAINTENANCE')),
    is_active       BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE property (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id      UUID NOT NULL REFERENCES management_company(id),
    name            VARCHAR(255) NOT NULL,
    address_line1   VARCHAR(255) NOT NULL,
    city            VARCHAR(120) NOT NULL,
    state           VARCHAR(2)   NOT NULL,
    zip             VARCHAR(10)  NOT NULL,
    unit_count      INT NOT NULL DEFAULT 0,
    office_hours    VARCHAR(255),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE unit (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id     UUID NOT NULL REFERENCES property(id),
    unit_number     VARCHAR(20) NOT NULL,
    bedrooms        INT NOT NULL,
    bathrooms       NUMERIC(3,1) NOT NULL,
    sqft            INT,
    market_rent     NUMERIC(10,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'OCCUPIED'
                    CHECK (status IN ('VACANT','OCCUPIED','NOTICE','MAKE_READY','DOWN')),
    available_on    DATE,
    UNIQUE (property_id, unit_number)
);

-- ========== PEOPLE ==========

CREATE TABLE resident (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    unit_id         UUID REFERENCES unit(id),
    full_name       VARCHAR(255) NOT NULL,
    email           VARCHAR(255),
    phone           VARCHAR(30),
    status          VARCHAR(20) NOT NULL DEFAULT 'CURRENT'
                    CHECK (status IN ('CURRENT','NOTICE','PAST','EVICTED')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE lease (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    unit_id         UUID NOT NULL REFERENCES unit(id),
    resident_id     UUID NOT NULL REFERENCES resident(id),
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL,
    monthly_rent    NUMERIC(10,2) NOT NULL,
    deposit         NUMERIC(10,2),
    status          VARCHAR(20) NOT NULL DEFAULT 'ACTIVE'
                    CHECK (status IN ('ACTIVE','MONTH_TO_MONTH','ENDED','TERMINATED'))
);

CREATE TABLE prospect (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id     UUID NOT NULL REFERENCES property(id),
    full_name       VARCHAR(255) NOT NULL,
    email           VARCHAR(255),
    phone           VARCHAR(30),
    desired_beds    INT,
    desired_move_in DATE,
    max_budget      NUMERIC(10,2),
    source          VARCHAR(60) NOT NULL DEFAULT 'PHONE',
    status          VARCHAR(20) NOT NULL DEFAULT 'NEW'
                    CHECK (status IN ('NEW','CONTACTED','TOUR_SCHEDULED','TOURED','APPLIED','LEASED','LOST')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ========== LEASING ==========

CREATE TABLE tour (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    prospect_id     UUID NOT NULL REFERENCES prospect(id),
    property_id     UUID NOT NULL REFERENCES property(id),
    unit_id         UUID REFERENCES unit(id),
    scheduled_at    TIMESTAMPTZ NOT NULL,
    tour_type       VARCHAR(20) NOT NULL DEFAULT 'IN_PERSON'
                    CHECK (tour_type IN ('IN_PERSON','SELF_GUIDED','VIRTUAL')),
    status          VARCHAR(20) NOT NULL DEFAULT 'SCHEDULED'
                    CHECK (status IN ('SCHEDULED','COMPLETED','NO_SHOW','CANCELED')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ========== VOICE ==========

CREATE TABLE voice_agent (
    id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id       UUID NOT NULL REFERENCES property(id),
    module            VARCHAR(20) NOT NULL
                      CHECK (module IN ('LEASING','MAINTENANCE','RENEWALS','DELINQUENCY','GENERAL')),
    retell_agent_id   VARCHAR(120),
    phone_number      VARCHAR(30),
    voice_name        VARCHAR(60) NOT NULL DEFAULT 'nova',
    system_prompt     TEXT,
    is_active         BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (property_id, module)
);

CREATE TABLE call (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id      UUID NOT NULL REFERENCES property(id),
    voice_agent_id   UUID REFERENCES voice_agent(id),
    resident_id      UUID REFERENCES resident(id),
    prospect_id      UUID REFERENCES prospect(id),
    retell_call_id   VARCHAR(120) UNIQUE,
    direction        VARCHAR(10) NOT NULL DEFAULT 'INBOUND'
                     CHECK (direction IN ('INBOUND','OUTBOUND')),
    caller_number    VARCHAR(30),
    module           VARCHAR(20) NOT NULL DEFAULT 'GENERAL'
                     CHECK (module IN ('LEASING','MAINTENANCE','RENEWALS','DELINQUENCY','GENERAL')),
    started_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    ended_at         TIMESTAMPTZ,
    duration_seconds INT,
    outcome          VARCHAR(30)
                     CHECK (outcome IN ('RESOLVED','TOUR_BOOKED','WORK_ORDER_CREATED','PAYMENT_PROMISED',
                                        'RENEWAL_ACCEPTED','ESCALATED','VOICEMAIL','HANGUP','TRANSFERRED')),
    sentiment        VARCHAR(10) CHECK (sentiment IN ('POSITIVE','NEUTRAL','NEGATIVE')),
    summary          TEXT,
    recording_url    VARCHAR(500)
);

CREATE TABLE call_transcript_segment (
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    call_id      UUID NOT NULL REFERENCES call(id) ON DELETE CASCADE,
    seq          INT NOT NULL,
    speaker      VARCHAR(10) NOT NULL CHECK (speaker IN ('AGENT','CALLER')),
    content      TEXT NOT NULL,
    offset_ms    INT,
    UNIQUE (call_id, seq)
);

-- ========== MODULES ==========

CREATE TABLE maintenance_request (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id     UUID NOT NULL REFERENCES property(id),
    unit_id         UUID REFERENCES unit(id),
    resident_id     UUID REFERENCES resident(id),
    call_id         UUID REFERENCES call(id),
    category        VARCHAR(30) NOT NULL
                    CHECK (category IN ('PLUMBING','ELECTRICAL','HVAC','APPLIANCE','PEST','LOCKOUT','OTHER')),
    description     TEXT NOT NULL,
    priority        VARCHAR(20) NOT NULL DEFAULT 'ROUTINE'
                    CHECK (priority IN ('EMERGENCY','URGENT','ROUTINE')),
    permission_to_enter BOOLEAN,
    status          VARCHAR(20) NOT NULL DEFAULT 'OPEN'
                    CHECK (status IN ('OPEN','SCHEDULED','IN_PROGRESS','COMPLETED','CANCELED')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    completed_at    TIMESTAMPTZ
);

CREATE TABLE renewal_offer (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lease_id        UUID NOT NULL REFERENCES lease(id),
    call_id         UUID REFERENCES call(id),
    offered_rent    NUMERIC(10,2) NOT NULL,
    term_months     INT NOT NULL DEFAULT 12,
    expires_on      DATE NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'SENT'
                    CHECK (status IN ('DRAFT','SENT','ACCEPTED','DECLINED','EXPIRED','NEGOTIATING')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE delinquency_case (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lease_id        UUID NOT NULL REFERENCES lease(id),
    call_id         UUID REFERENCES call(id),
    amount_owed     NUMERIC(10,2) NOT NULL,
    days_late       INT NOT NULL DEFAULT 0,
    promise_to_pay_on DATE,
    promised_amount NUMERIC(10,2),
    status          VARCHAR(20) NOT NULL DEFAULT 'OPEN'
                    CHECK (status IN ('OPEN','PROMISE_MADE','PAID','BROKEN_PROMISE','LEGAL','CLOSED')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE escalation_ticket (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    call_id         UUID REFERENCES call(id),
    property_id     UUID NOT NULL REFERENCES property(id),
    assigned_to     UUID REFERENCES staff_user(id),
    reason          VARCHAR(50) NOT NULL,
    notes           TEXT,
    priority        VARCHAR(20) NOT NULL DEFAULT 'NORMAL'
                    CHECK (priority IN ('LOW','NORMAL','HIGH','CRITICAL')),
    status          VARCHAR(20) NOT NULL DEFAULT 'OPEN'
                    CHECK (status IN ('OPEN','IN_PROGRESS','RESOLVED','CLOSED')),
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    resolved_at     TIMESTAMPTZ
);

-- ========== CONFIG ==========

CREATE TABLE routing_rule (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id     UUID NOT NULL REFERENCES property(id),
    module          VARCHAR(20) NOT NULL
                    CHECK (module IN ('LEASING','MAINTENANCE','RENEWALS','DELINQUENCY','GENERAL')),
    trigger_keyword VARCHAR(120),
    condition_json  JSONB,
    action          VARCHAR(30) NOT NULL
                    CHECK (action IN ('HANDLE_WITH_AI','TRANSFER_TO_STAFF','TAKE_MESSAGE','ESCALATE')),
    transfer_target UUID REFERENCES staff_user(id),
    priority        INT NOT NULL DEFAULT 100,
    is_active       BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE knowledge_article (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id     UUID NOT NULL REFERENCES property(id),
    module          VARCHAR(20) NOT NULL DEFAULT 'GENERAL'
                    CHECK (module IN ('LEASING','MAINTENANCE','RENEWALS','DELINQUENCY','GENERAL')),
    title           VARCHAR(255) NOT NULL,
    content         TEXT NOT NULL,
    is_published    BOOLEAN NOT NULL DEFAULT TRUE,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ========== INDEXES ==========

CREATE INDEX idx_call_property_started ON call(property_id, started_at DESC);
CREATE INDEX idx_call_module ON call(module);
CREATE INDEX idx_transcript_call ON call_transcript_segment(call_id);
CREATE INDEX idx_maint_property_status ON maintenance_request(property_id, status);
CREATE INDEX idx_prospect_property_status ON prospect(property_id, status);
CREATE INDEX idx_unit_property_status ON unit(property_id, status);
CREATE INDEX idx_routing_property_module ON routing_rule(property_id, module, priority);