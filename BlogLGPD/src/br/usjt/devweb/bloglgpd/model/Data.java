package br.usjt.devweb.bloglgpd.model;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Data {

	public Timestamp formata(String data) throws Exception {
		String dataString = data;
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		java.sql.Timestamp dataFormatada = new java.sql.Timestamp(df.parse(dataString).getTime());
		return dataFormatada;
	}
}
