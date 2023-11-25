package com.project.hospital.utils;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import com.project.hospital.model.Usuario;

import jakarta.servlet.http.HttpSession;

public class Utils {
	
	public static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public static boolean isLogged(HttpSession session) {
		List<String> atributos = Collections.list(session.getAttributeNames());
		if (atributos.contains("user")) {
			return session.getAttribute("user") != null;
		}
		return false;
	}

	public static boolean isAdmin(Usuario user) {
		if (user == null) {
			return false;
		}
		return user.getRol().equals("Admin");
	}

	public static boolean isUser(Usuario user) {
		if (user == null) {
			return false;
		}
		return user.getRol().equals("Usuario");
	}
}
