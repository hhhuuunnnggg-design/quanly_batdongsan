package com.javaweb.repository;

import com.javaweb.entity.AssignBuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AssignBuildingRepository extends JpaRepository<AssignBuildingEntity,Long> {
    void deleteByBuildingEntity_IdIn(Long[] ids);;

//    void deleteBuildingEntityId(Long id);
}
