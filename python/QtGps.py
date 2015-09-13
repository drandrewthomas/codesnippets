#!/usr/bin/python

# Programmed: Andrew Thomas.
# E-mail:     andrew at geocomputing co uk.
# Date:       December 2009.
# Requires:   liblocation.py (see link below).
# Uses:       liblocation.py and gpsexample.py which are
#             Copyright 2008 by Robert W. Brewer.
#             See http://talk.maemo.org/showthread.php?t=19009
# Notes:      No warranty even of merchantability is provides.
#             Use and modify at your own risk.
#             Programmed on a Nokia N810 using PyGTKEditor.

import sys
from PyQt4 import QtGui
from PyQt4 import QtCore
from timer import Ui_MainWindow
import liblocation
import gobject

class gpscontrol(QtGui.QWidget):

    def __init__(self, parent=None):
        # Set up variables and gui elements
        global gpsd_control
        global gpson
        global lastlat
        global lastlong
        global lastalt
        global doingtrack
        global logtrack
        global ft
        self.gpson=0
        self.lastlat=0
        self.lastlong=0
        self.lastalt=0
        self.doingtrack=0
        self.logtrack=0
        self.ft=0
        QtGui.QWidget.__init__(self, parent)
        self.setWindowTitle('QtGps')
        # -----------------------------------
        self.gpsb = QtGui.QPushButton('Connect to the\nGPS device', self)
        self.gpsb.setCheckable(False)
        self.gpsb.setGeometry(20, 5, 310, 115)
        self.connect(self.gpsb, QtCore.SIGNAL('clicked()'), self.setgps)
        # -----------------------------------
        self.swpb = QtGui.QPushButton('Save KML waypoint', self)
        self.swpb.setCheckable(False)
        self.swpb.setGeometry(350, 5, 350, 115)
        self.connect(self.swpb, QtCore.SIGNAL('clicked()'), self.savewaypoint)
        # -----------------------------------
        self.label1 = QtGui.QLabel(self)
        self.label1.setGeometry(350, 150, 65, 30)
        self.label1.setText('Name:')
        # -----------------------------------
        self.lognamebox = QtGui.QLineEdit(self)
        self.lognamebox.setGeometry(425, 150, 275, 30)
        self.lognamebox.setText('GPS log')
        # -----------------------------------
        self.tstb = QtGui.QPushButton('Stop\nlogging', self)
        self.tstb.setCheckable(False)
        self.tstb.setGeometry(530, 210, 170, 170)
        self.connect(self.tstb, QtCore.SIGNAL('clicked()'), self.stoptrack)
        # -----------------------------------
        self.tgob = QtGui.QPushButton('Start\nlogging', self)
        self.tgob.setCheckable(False)
        self.tgob.setGeometry(350, 210, 170, 170)
        self.connect(self.tgob, QtCore.SIGNAL('clicked()'), self.starttrack)
        # -----------------------------------
        self.statuslabel = QtGui.QLabel(self)
        self.statuslabel.setGeometry(20, 150, 310, 30)
        self.statuslabel.setText('Status: Disconnected')
        # -----------------------------------
        self.satsusedlabel = QtGui.QLabel(self)
        self.satsusedlabel.setGeometry(20, 210, 310, 30)
        self.satsusedlabel.setText('No satellites')
        # -----------------------------------
        self.longitudelabel = QtGui.QLabel(self)
        self.longitudelabel.setGeometry(20, 250, 310, 30)
        self.longitudelabel.setText('No longitude')
        # -----------------------------------
        self.latitudelabel = QtGui.QLabel(self)
        self.latitudelabel.setGeometry(20, 290, 310, 30)
        self.latitudelabel.setText('No latitude')
        # -----------------------------------
        self.altitudelabel = QtGui.QLabel(self)
        self.altitudelabel.setGeometry(20, 330, 310, 30)
        self.altitudelabel.setText('No altitude')
        # -----------------------------------
        gobject.threads_init()
        gps = liblocation.gps_device_get_new()
        gps.connect('changed', self.notify_gps_update)
        gpsd_control = liblocation.gpsd_control_get_default()

    def closeEvent(self, event):
      # Close track files and stop the gps before exiting
      if self.logtrack==1:
        self.logtrack=0
      if self.doingtrack==1:
        self.stoptrack()
        self.doingtrack=0
      if self.gpson==1:
        self.setgps()
        event.accept()

    def savewaypoint(self):
        # Save coordinates to a kml waypoint file
        if self.gpson==1:
          fileName='/home/user/MyDocs/waypoint-%s.kml'%self.lognamebox.text()
          f = open(fileName,"w")
          f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
          f.write('<kml xmlns="http://www.opengis.net/kml/2.2">\n')
          f.write('  <Placemark>\n')
          f.write('    <name>\n')
          f.write('      ')
          f.write(self.lognamebox.text())
          f.write('\n')
          f.write('    </name>\n')
          f.write('    <description>QtGps Waypoint</description>\n')
          f.write('    <Point>\n')
          f.write('      <coordinates>\n')
          f.write('        ')
          f.write(str(self.lastlong))
          f.write(',')
          f.write(str(self.lastlat))
          f.write(',')
          f.write(str(self.lastalt))
          f.write('\n')
          f.write('      </coordinates>\n')
          f.write('    </Point>\n')
          f.write('  </Placemark>\n')
          f.write('</kml>\n')
          f.flush()
          f.close()

    def starttrack(self):
        # Write kml track header and start logging
        # If already logging, pause or resume logging
        if self.doingtrack==1:
          if self.logtrack==1:
            self.tgob.setText('Continue\nlogging')
            self.logtrack=0
          else:
            self.tgob.setText('Pause\nlogging')
            self.logtrack=1
        else:
          if self.gpson==1:
            fileName='/home/user/MyDocs/track-%s.kml'%self.lognamebox.text()
            self.ft = open(fileName,"w")
            self.doingtrack=1
            self.logtrack=1
            self.tgob.setText('Pause\nlogging')
            self.ft.write('<?xml version="1.0" encoding="UTF-8"?>\n')
            self.ft.write('<kml xmlns="http://www.opengis.net/kml/2.2">\n')
            self.ft.write('  <Document>\n')
            self.ft.write('    <name>\n')
            self.ft.write('      ')
            self.ft.write(self.lognamebox.text())
            self.ft.write('\n')
            self.ft.write('    </name>\n')
            self.ft.write('    <description>QtGps Track Path</description>\n')
            self.ft.write('    <Style id="yellowLineGreenPoly">\n')
            self.ft.write('      <LineStyle>\n')
            self.ft.write('        <color>7f00ffff</color>\n')
            self.ft.write('        <width>4</width>\n')
            self.ft.write('      </LineStyle>\n')
            self.ft.write('      <PolyStyle>\n')
            self.ft.write('        <color>7f00ff00</color>\n')
            self.ft.write('      </PolyStyle>\n')
            self.ft.write('    </Style>\n')
            self.ft.write('    <Placemark>\n')
            self.ft.write('      <name>Absolute Extruded</name>\n')
            self.ft.write('      <description>Transparent green wall with yellow outlines</description>\n')
            self.ft.write('      <styleUrl>#yellowLineGreenPoly</styleUrl>\n')
            self.ft.write('      <LineString>\n')
            self.ft.write('        <extrude>1</extrude>\n')
            self.ft.write('        <tessellate>1</tessellate>\n')
            self.ft.write('        <altitudeMode>absolute</altitudeMode>\n')
            self.ft.write('        <coordinates>\n')

    def stoptrack(self):
        # Stop logging and write end of kml track file
        if self.doingtrack==1:
          self.logtrack=0
          self.doingtrack=0
          self.tgob.setText('Start\nlogging')
          self.ft.write('        </coordinates>\n')
          self.ft.write('      </LineString>\n')
          self.ft.write('    </Placemark>\n')
          self.ft.write('  </Document>\n')
          self.ft.write('</kml>\n')
          self.ft.flush()
          self.ft.close()

    def setgps(self):
       # Start or stop the gps daemon
       if self.gpson==0:
        liblocation.gpsd_control_start(gpsd_control)
        self.gpsb.setText('Disconnect from\nthe GPS device')
        self.statuslabel.setText('Status: Connecting...')
        self.gpson=1
       else:          
        if self.doingtrack==1:
          self.stoptrack()
        liblocation.gpsd_control_stop(gpsd_control)
        self.gpsb.setText('Connect to the\nGPS device')
        self.statuslabel.setText('Status: Disconnected')
        self.gpson=0

    def notify_gps_update(self,gps_dev):
      # Handle gps daemon events and save coordinates to kml
      # track file if currently logging
      gps_struct = gps_dev.struct()
      fix = gps_struct.fix
      self.statuslabel.setText('Status: Connected')
      self.satsusedlabel.setText('Satellites: %i of %i'%(gps_struct.satellites_in_use,gps_struct.satellites_in_view))
      if fix:
        self.latitudelabel.setText('Latitude: %f'%fix.latitude)
        self.longitudelabel.setText('Longitude: %f'%fix.longitude)
        self.altitudelabel.setText('Altitude: %f'%fix.altitude)
        self.lastlat=fix.latitude
        self.lastlong=fix.longitude
        self.lastalt=fix.altitude
        if self.logtrack==1:
          self.ft.write('        ')
          self.ft.write(str(self.lastlong))
          self.ft.write(',')
          self.ft.write(str(self.lastlat))
          self.ft.write(',')
          self.ft.write(str(self.lastalt))
          self.ft.write('\n')

# Start the Qt program running
app = QtGui.QApplication(sys.argv)
gp = gpscontrol()
gp.show()
app.exec_()
