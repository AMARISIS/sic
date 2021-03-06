package com.phimes.sic.business.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;

import com.phimes.sic.business.dao.AccessRepository;
import com.phimes.sic.business.dao.FilterRepository;
import com.phimes.sic.api.dto.FilterDto;
import com.phimes.sic.api.dto.FunctionDto;
import com.phimes.sic.api.service.IFilterService;
import com.phimes.sic.business.model.Filter;
import com.phimes.sic.business.model.Function;

@org.springframework.stereotype.Service
public class FilterService extends Service<Filter, Long> implements IFilterService {

	@Autowired
	private FilterRepository rep;

	@Override
	protected CrudRepository getCrudRep() {

		return rep;
	}

	ModelMapper modelMapper = new ModelMapper();

	public List<FilterDto> getFilterListDto(String codeAr, String codeLv) {
		Set<Filter> filter = rep.getFilterList(codeAr, codeLv);

		List<FilterDto> retListFl = new ArrayList<>();

		for (Filter item : filter) {
			FilterDto dto = modelMapper.map(item, FilterDto.class);
			retListFl.add(dto);

		}
		return retListFl;
	}

	public List<FilterDto> getFilterListDtoByCodeApp(String codeApp) {
		Set<Filter> filter = rep.getFilterListByCodeApp(codeApp);

		List<FilterDto> retListFlByArea = new ArrayList<>();

		for (Filter item : filter) {
			FilterDto dto = modelMapper.map(item, FilterDto.class);
			retListFlByArea.add(dto);
		}
		return retListFlByArea;
	}
	
	
	public List<FilterDto> getFilterListDtoByLevel(String codeLv) {
		Set<Filter> filter = rep.getFilterListByLevel(codeLv);

		List<FilterDto> retListFlByLevel = new ArrayList<>();

		for (Filter item : filter) {
			FilterDto dto = modelMapper.map(item, FilterDto.class);
			retListFlByLevel.add(dto);
		}
		return retListFlByLevel;
	}
}