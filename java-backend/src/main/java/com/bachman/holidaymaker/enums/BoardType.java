package com.bachman.holidaymaker.enums;

public enum BoardType {

    NONE("None"),
    HB("Half board"),
    FB("Full board"),
    AI("All-Inclusive");

    private String boardType;

    BoardType(String type) {
        this.boardType = type;
    }

    public String getBoardType() {
        return boardType;
    }

}
