package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchResponseConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item) {
        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);
        building.setAddress(
                item.getStreet() + ", " + item.getWard() + ", " + districtCode.type().get(item.getDistrict()));
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue()).collect(Collectors.joining(","));
        building.setRentArea(areaResult);
        return building;
    }
}
