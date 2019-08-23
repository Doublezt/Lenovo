package entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.ComputerDAO;

public class Computer {
	int id;
	String name;
	int price;
	String cpu;
	int memory;
	int hardDisk;
	int type;
	int size;
	Date launchDate;
	Boolean isDel;
	List<String> imagePaths = new ArrayList<String>();
	
	public String getIdByAllParameters(String computerName, int memory, int hardDisk, String cpu, int size) {
		return ComputerDAO.getIdByAllParameters(computerName, memory, hardDisk, cpu, size);
	}

	
	public String getOneImageByComputerId(int computerId) {
		return ComputerDAO.getOneImageByComputerId(computerId);
	}
	
	public String getComputerNameById(int computerId) {
		return ComputerDAO.getComputerNameById(computerId);
	}
	
	public String getAllComputerJsonString(int pageNumber, int pageSize) {
		return ComputerDAO.getAllComputerJsonStringDAO(pageNumber, pageSize);
	}
	
	public Boolean addComputer(String name, int price, String cpu, int memory, int hardDisk, int type, int size) {
		return ComputerDAO.addComputerDAO(name, price, cpu, memory, hardDisk, type, size);
	}
	
	public void uploadComputerImages(String name, List<String> paths) {
		 ComputerDAO.uploadComputerImages(name, paths);
	}
	
	public Boolean updateComputer(int id, String name, int price, String cpu, int memory, int hardDisk, int type, int size) {
		return ComputerDAO.updateComputer(id, name, price, cpu, memory, hardDisk, type, size);
	}
	
	public Boolean addComputer(String name, int price, String cpu, 
			int memory, int hardDisk, int type, int size,List<String> imagePaths) {
		return ComputerDAO.addComputerDAO2(name, price, cpu, memory, hardDisk, type, size, imagePaths);
	}
	
	public String findComputer(String cpu, int hardDisk, int memory, int size, int lowPrice, int highPrice) {
		return ComputerDAO.findComputerDAO(cpu, hardDisk, memory, size, lowPrice, highPrice);
	}
	
	public String findComputer(String name) {
		return ComputerDAO.findComputerDAO(name);
	}
	
	public List<Computer> findComputer(int type) {
		return ComputerDAO.findComputerDAO(type);
	}
	
	public String findComputerById(int id) {
		return ComputerDAO.findComputerByIdDAO(id);
	}
	
	public String findComputer(String name, int type) {
		return ComputerDAO.findComputerDAO(name, type);
	}
	
	public void addImagePath(String path) {
		imagePaths.add(path);
	}
	
	public String getImagePaths(String computerName) {
		return ComputerDAO.getImagePathsDAO(computerName);
	}
	
	public Boolean deleteComputerById(int id) {
		return ComputerDAO.deleteComputerById(id);
	}
	
	public boolean isExist(int id) {
		return ComputerDAO.isExist(id);
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getCpu() {
		return cpu;
	}
	
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	
	public int getMemory() {
		return memory;
	}
	
	public void setMemory(int memory) {
		this.memory = memory;
	}
	
	public int getHardDisk() {
		return hardDisk;
	}
	
	public void setHardDisk(int hardDisk) {
		this.hardDisk = hardDisk;
	}
	
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	public int getSize() {
		return size;
	}
	
	public void setSize(int size) {
		this.size = size;
	}
	
	public Date getLaunchDate() {
		return launchDate;
	}
	
	public void setLaunchDate(Date launchDate) {
		this.launchDate = launchDate;
	}
	
	public Boolean getIsDel() {
		return isDel;
	}
	
	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}
	
}
