package com.bachman.holidaymaker.enums;

public enum RoomType {

        SINGLE("Single"),
        DOUBLE("Double"),
        STUDIO("Studio");

        private String roomType;

        RoomType(String type) {
            this.roomType = type;
        }

        public String getRoomType() {
            return roomType;
        }

}
