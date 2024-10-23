package com.javaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity extends BaseEntity {

    @Column(name = "value")
    private String value;

    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity buildingEntity;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public BuildingEntity getBuildingEntity() {
        return buildingEntity;
    }

    public void setBuildingEntity(BuildingEntity buildingEntity) {
        this.buildingEntity = buildingEntity;
    }

}
