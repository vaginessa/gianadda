package org.tastefuljava.gianadda.domain;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import org.tastefuljava.gianadda.geo.TrackPoint;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.tastefuljava.gianadda.geo.GpxReader;
import org.tastefuljava.gianadda.geo.GpxWriter;
import org.tastefuljava.gianadda.geo.LatLngBounds;

public class Track {
    private static final Logger LOG = Logger.getLogger(Track.class.getName());

    private int id;
    private Folder folder;
    private String name;
    private Date dateTime;
    private LatLngBounds bounds;
    private String gpx;

    public int getId() {
        return id;
    }

    public Folder getFolder() {
        return folder;
    }

    public void setFolder(Folder folder) {
        this.folder = folder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public void setPoints(TrackPoint[] newValue) {
        StringWriter writer = new StringWriter();
        GpxWriter.writeTrack(newValue, writer);
        gpx = writer.toString();
    }

    public TrackPoint[] getPoints() {
        try (InputStream in = new ByteArrayInputStream(gpx.getBytes("UTF-8"))) {
            return GpxReader.readTrack(in);
        } catch (IOException ex) {
            LOG.log(Level.SEVERE, null, ex);
            throw new RuntimeException(ex.getMessage());
        }
    }
}
