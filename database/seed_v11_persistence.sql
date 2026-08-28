USE smart_skill_map;

-- Add persistent tracking columns to users
ALTER TABLE users ADD COLUMN IF NOT EXISTS enrolled_career_id BIGINT;
ALTER TABLE users ADD COLUMN IF NOT EXISTS progress_json TEXT;
