package com.babystep.model;

public class VaccineDTO {

		
		private int VAC_ID ;
		private String VAC_NAME ;
		private int VAC_AGE;

		public VaccineDTO(int VAC_ID, String VAC_NAME, int VAC_AGE) {
			
			this.VAC_ID = VAC_ID;
			this.VAC_NAME = VAC_NAME;
			this.VAC_AGE = VAC_AGE;
		}


		public int getVAC_ID() {
			return VAC_ID;
		}


		public String getVAC_NAME() {
			return VAC_NAME;
		}


		public int getVAC_AGE() {
			return VAC_AGE;
		}
		
	}



