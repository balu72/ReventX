"""
Scheduler Models Module

This module contains all the database model definitions used by the meeting scheduler.
Extracted from run_scheduler.py for better code organization.
"""

from sqlalchemy import Column, Integer, String, DateTime, Boolean, ForeignKey, Text, Enum as SQLEnum
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from flask_sqlalchemy import SQLAlchemy
import enum
from datetime import datetime

# Initialize SQLAlchemy instance
db = SQLAlchemy()

# Define MeetingStatus enum
class MeetingStatus(enum.Enum):
    PENDING = "PENDING"
    ACCEPTED = "ACCEPTED"
    REJECTED = "REJECTED"
    CANCELLED = "CANCELLED"

# Define models directly
class User(db.Model):
    __tablename__ = 'users'
    
    id = db.Column(db.Integer, primary_key=True)
    role = db.Column(db.String(50), nullable=False)
    username = db.Column(db.String(80))

class SystemSetting(db.Model):
    __tablename__ = 'system_settings'
    
    id = db.Column(db.Integer, primary_key=True)
    key = db.Column(db.String(100), unique=True, nullable=False)
    value = db.Column(db.Text, nullable=False)
    description = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

class SellerProfile(db.Model):
    __tablename__ = 'seller_profiles'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    business_name = db.Column(db.String(200), nullable=False)
    description = db.Column(db.Text)
    seller_type = db.Column(db.String(200))
    target_market = db.Column(db.String(200))
    logo_url = db.Column(db.String(255))
    website = db.Column(db.String(255))
    contact_email = db.Column(db.String(200))
    contact_phone = db.Column(db.String(20))
    address = db.Column(db.Text)
    is_verified = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime)
    gst = db.Column(db.String(20))
    pincode = db.Column(db.String(10))
    instagram = db.Column(db.String(200))
    status = db.Column(db.String(20), default='active')
    assn_member = db.Column(db.Boolean, default=False)
    property_type_id = db.Column(db.Integer)
    state = db.Column(db.String(100))
    country = db.Column(db.String(50))
    business_images = db.Column(db.JSON, default=lambda: [])
    microsite_url = db.Column(db.String(500))
    salutation = db.Column(db.String(10))
    first_name = db.Column(db.String(200))
    last_name = db.Column(db.String(200))
    designation = db.Column(db.String(100))
    start_year = db.Column(db.Integer)
    company_name = db.Column(db.String(200))
    mobile = db.Column(db.String(15))
    city = db.Column(db.String(50))

class BuyerProfile(db.Model):
    __tablename__ = 'buyer_profiles'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    organization = db.Column(db.String(200))
    category_id = db.Column(db.Integer, db.ForeignKey('buyer_categories.id'))
    interests = db.Column(db.JSON, nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

class BuyerCategory(db.Model):
    __tablename__ = 'buyer_categories'
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    max_meetings = db.Column(db.Integer)

class StallType(db.Model):
    __tablename__ = 'stall_types'
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    attendees = db.Column(db.Integer)
    max_meetings_per_attendee = db.Column(db.Integer)

class Stall(db.Model):
    __tablename__ = 'stalls'
    
    id = db.Column(db.Integer, primary_key=True)
    seller_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    number = db.Column(db.String(20), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime)
    stall_type_id = db.Column(db.Integer, db.ForeignKey('stall_types.id'))
    allocated_stall_number = db.Column(db.String(15))
    fascia_name = db.Column(db.String(100))
    is_allocated = db.Column(db.Boolean, default=False)
    stall_id = db.Column(db.Integer)

class Meeting(db.Model):
    __tablename__ = 'meetings'
    
    id = db.Column(db.Integer, primary_key=True)
    buyer_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    seller_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    time_slot_id = db.Column(db.Integer, db.ForeignKey('time_slots.id'))
    notes = db.Column(db.Text)
    status = db.Column(SQLEnum(MeetingStatus), nullable=False, default=MeetingStatus.PENDING)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime)
    attendee_id = db.Column(db.Integer)
    meeting_date = db.Column(db.Date)
    meeting_time = db.Column(db.Time)
    requestor_id = db.Column(db.Integer, db.ForeignKey('users.id'))

class TimeSlot(db.Model):
    __tablename__ = 'time_slots'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime, nullable=False)
    is_available = db.Column(db.Boolean, default=True)
    meeting_id = db.Column(db.Integer, nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

class StallInventory(db.Model):
    __tablename__ = 'stall_inventory'
    
    id = db.Column(db.Integer, primary_key=True)
    stall_number = db.Column(db.String(15), nullable=False)
    stall_type_id = db.Column(db.Integer, db.ForeignKey('stall_types.id'))
    allow_seller_selection = db.Column(db.Boolean, default=True)
    is_allocated = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime)
    updated_at = db.Column(db.DateTime)

class StallDistanceMatrix(db.Model):
    __tablename__ = 'stall_distance_matrix'
    
    id = db.Column(db.Integer, primary_key=True)
    origin_stall_id = db.Column(db.Integer, db.ForeignKey('stall_inventory.id'), nullable=False)
    destination_stall_id = db.Column(db.Integer, db.ForeignKey('stall_inventory.id'), nullable=False)
    distance = db.Column(db.SmallInteger, nullable=False)
    created_at = db.Column(db.DateTime)
    updated_at = db.Column(db.DateTime)

class SellerAttendees(db.Model):
    __tablename__ = 'seller_attendees'
    
    id = db.Column(db.Integer, primary_key=True)
    seller_profile_id = db.Column(db.Integer, db.ForeignKey('seller_profiles.id'), nullable=True)
    attendee_number = db.Column(db.Integer, nullable=True)
    name = db.Column(db.String(255), nullable=True)
    designation = db.Column(db.String(255), nullable=True)
    email = db.Column(db.String(255), nullable=True)
    mobile = db.Column(db.String(255), nullable=True)
    is_primary_contact = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
