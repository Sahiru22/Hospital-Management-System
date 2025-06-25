package com.channel;

import java.util.List;

public interface ChannelService {
    boolean addAppointment(String did, String pid, String date, String name, String age);
    boolean updateAppointment(String cid, String pid, String name, String age, String did, String date);
    boolean deleteAppointment(String cid);
    List<Channel> getAppointmentsByPatientId(String pid);
}
