package com.deco.tickexperience.model.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

/**
 * Ticket entity
 * (seat, location) are unique pairs
 * may benefit from separate model in future
 */
@Entity
@Data
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer seatNumber;
    private Long price;
    private String QRCode;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="EventId")
    private Event event;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="UserId")
    private User user;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="SectionId")
    private Section section;
}
