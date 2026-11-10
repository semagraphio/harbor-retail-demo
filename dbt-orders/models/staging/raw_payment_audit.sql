select id as audit_id, payment_id, checked_at
from {{ source('lake', 'payment_audit') }}
