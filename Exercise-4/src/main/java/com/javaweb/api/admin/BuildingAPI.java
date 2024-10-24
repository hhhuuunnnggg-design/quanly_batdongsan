package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.AssignBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.AssignmentBuildingServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfadmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    private static final Logger log = LoggerFactory.getLogger(BuildingAPI.class);
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private AssignBuildingRepository assignBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    //update
    @PostMapping
    public BuildingDTO btnAddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        // xuong db de update
        return buildingDTO;
    }

//    Delete
    @Transactional
    @DeleteMapping("/{ids}")
    public void deleteBuilDing(@PathVariable Long[] ids) {
        rentAreaRepository.deleteByBuildingEntity_IdIn(ids);
        assignBuildingRepository.deleteByBuildingEntity_IdIn(ids);
        buildingRepository.deleteByIdIn(ids);

        System.out.println("đã xóa thành công {ids} "+ids);

    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result=buildingService.listStaffs(id);
        return result;
    }

    @Transactional
    @PostMapping("/assigment") // chức năng giao tòa nhà cho nhiên viên quản lý
    public void updateAssigmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assignBuildingRepository.deleteByBuildingEntityId(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingService.createAssignmentBuilding(assignmentBuildingDTO);
        System.out.println("đây chiính là giao toa nha");
    }
}
