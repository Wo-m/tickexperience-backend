package com.deco.tickexperience.service;

import com.deco.tickexperience.model.entity.Event;
import com.deco.tickexperience.model.entity.Sport;
import com.deco.tickexperience.model.entity.VenueImage;
import com.deco.tickexperience.model.entity.Video;
import com.deco.tickexperience.repository.SportRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SportService {

    private final SportRepository sportRepository;

    public List<Sport> getAllSports() {
        return (List<Sport>) sportRepository.findAll();
    }

    public List<Event> getEvents(final Long sportId) {
        Sport sport = sportRepository.findById(sportId).orElseThrow(() ->
                new RuntimeException("gimbal lock is a not good thing I think"));
        return sport.getEvents();
    }
}
