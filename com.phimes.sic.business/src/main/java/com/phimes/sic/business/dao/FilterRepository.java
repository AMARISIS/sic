package com.phimes.sic.business.dao;

import java.util.stream.Stream;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.phimes.sic.business.model.Filter;

import antlr.collections.List;

@org.springframework.stereotype.Repository

public interface FilterRepository extends CrudRepository<Filter, Long> {

	@Query("select fl.code, fl.description, fl.longDescription, lv from Filter fl join Level lv join Area ar where ar.code =: codeAr and lv.code =: codeLv and fl.code =: codeFl")
	Filter findOne(@Param("codeAr") String codeAr, @Param("codeLv") String codeLv, @Param("codeFl") String codeFl);
	
	@Query("select fl.code, fl.description, fl.longDescription, lv from Filter fl join Level lv join Area ar where ar.code =: codeAr and lv.code =: codeLv and fl.code =: codeFl")
	java.util.List <Filter> getFilterList(@Param("codeAr") String codeAr, @Param("codeLv") String codeLv, @Param("codeFl") String codeFl); 

}
