//package com.javaweb.entity;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "assignmentbuilding")
//public class AssignmentbuildingEntity extends BaseEntity{
//
//    @ManyToOne
//    @JoinColumn(name = "staffid")
//    private UserEntity userEntity;
//
//    @ManyToOne
//    @JoinColumn(name = "buildingid")
//    private BuildingEntity buildingEntity;
//
//    public BuildingEntity getBuildingEntity() {
//        return buildingEntity;
//    }
//
//    public void setBuildingEntity(BuildingEntity buildingEntity) {
//        this.buildingEntity = buildingEntity;
//    }
//
//    public UserEntity getUserEntity() {
//        return userEntity;
//    }
//
//    public void setUserEntity(UserEntity userEntity) {
//        this.userEntity = userEntity;
//    }
//}
