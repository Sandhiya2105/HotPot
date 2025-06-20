package com.example.demo.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name="Menu")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Menu {

    @Id
    private int menId;
    private String menItem;
    private double menPrice;
    private int menCalories;
    private String menSpeciality;

    @ManyToOne
    @JoinColumn(name = "restaurant_id")
    private Restaurants restaurant;
}
