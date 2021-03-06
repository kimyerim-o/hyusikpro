package info.service;

import java.util.List;

import info.dto.BrandDto;
import info.dto.FoodDto;
import info.dto.OilDto;
import info.dto.OilconDto;
import info.dto.RestconDto;
import info.dto.RestinfoDto;

public class InfoData {
	private List<BrandDto> brand;
	private List<FoodDto> food;
	private List<OilconDto> oilcon;
	private OilDto oil;
	private List<RestconDto> restcon;
	private RestinfoDto restinfo;
	private List<RestinfoDto> restinfos;
	
	
	public InfoData(List<BrandDto> brand, List<FoodDto> food, List<OilconDto> oilcon, OilDto oil, List<RestconDto> restcon, RestinfoDto restinfo) {
		this.brand = brand;
		this.food=food;
		this.oilcon=oilcon;
		this.oil=oil;
		this.restcon=restcon;
		this.restinfo=restinfo;
	}

	public InfoData(List<RestinfoDto> restinfos) {
		this.setRestinfos(restinfos);
	}

	public List<BrandDto> getBrand() {
		return brand;
	}

	public List<FoodDto> getFood() {
		return food;
	}

	public List<OilconDto> getOilcon() {
		return oilcon;
	}

	public OilDto getOil() {
		return oil;
	}

	public List<RestconDto> getRestcon() {
		return restcon;
	}

	public RestinfoDto getRestinfo() {
		return restinfo;
	}

	public List<RestinfoDto> getRestinfos() {
		return restinfos;
	}

	public void setRestinfos(List<RestinfoDto> restinfos) {
		this.restinfos = restinfos;
	}
	
	
}
