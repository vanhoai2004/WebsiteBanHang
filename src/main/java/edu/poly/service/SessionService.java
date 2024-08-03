package edu.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {

	@Autowired
    private HttpSession session;

    public void set(String key, Object value) {
        session.setAttribute(key, value);
    }

    public String get(String key, String defaultValue) {
        Object value = session.getAttribute(key);
        return value != null ? value.toString() : defaultValue;
    }
}
