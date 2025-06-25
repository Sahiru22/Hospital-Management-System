package com.channel;

import java.util.List;

public class ChannelServiceImpl implements ChannelService {

    @Override
    public boolean addAppointment(String did, String pid, String date, String name, String age) {
        return ChannelingDBUtil.addAppoinment(did, pid, date, name, age);
    }

    @Override
    public boolean updateAppointment(String cid, String pid, String name, String age, String did, String date) {
        return ChannelingDBUtil.updateChannel(cid, pid, name, age, did, date);
    }

    @Override
    public boolean deleteAppointment(String cid) {
        return ChannelingDBUtil.deleteAppoinment(cid);
    }

    @Override
    public List<Channel> getAppointmentsByPatientId(String pid) {
        return ChannelingDBUtil.getAppointmentById(pid);
    }
}
