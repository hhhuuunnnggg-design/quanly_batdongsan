package com.javaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);

    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
}
