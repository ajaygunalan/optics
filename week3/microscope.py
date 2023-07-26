from rayoptics.elem.gap import Gap
from rayoptics.elem.surface import InteractSurface
from rayoptics.elem.medium import Homogeneous, Medium  # Add Medium to the import statement

# Rest of the code


def create_microscope_system(object_distance, objective_focal_length, tube_length, eyepiece_focal_length):
    # Create a new model
    opm = OpticalModel()
    sm  = opm.seq_model
    osp = opm.optical_spec
    pm = opm.parax_model

    # Define wavelengths and fields
    osp.pupil = PupilSpec(osp, key=['object', 'pupil'], value=5.0)
    osp.field_of_view = FieldSpec(osp, key=['object', 'angle'], flds=[0.0])
    osp.spectral_region = WvlSpec([(486.1327, 0.5), (587.5618, 1.0), (656.2725, 0.5)], ref_wl=1)

    # Set object distance
    opm.radius_mode = True
    osp_obj = osp.obj_dist = object_distance

    # Create objective lens
    sm.gaps[0].thi=1e10
    obj_lens = singlet_lens(objective_focal_length, osp_obj, opm)  # pass opm instead of sm

    # Create tube gap
    tube_gap = Element(2, [], [tube_length])
    opm.add_element(tube_gap)

    # Create eyepiece lens
    eyepiece_lens = singlet_lens(eyepiece_focal_length, tube_length + eyepiece_focal_length, opm)  # pass opm instead of sm

    # Update model
    opm.update_model()

    return opm


def singlet_lens(focal_length, object_distance, opm):
    seq_model = opm.seq_model
    medium = Medium()
    medium.glass = Glass('N-BK7')
    radius1 = focal_length / (2 * (medium.index(0) - 1))
    radius2 = -radius1
    seq_model.append_surface(InteractSurface(profile=Spherical(radius1),
                                            interact_mode=InteractMode.TRANSMIT),
                             gap=Gap(d=object_distance),
                             medium=medium)
    seq_model.append_surface(InteractSurface(profile=Spherical(radius2),
                                            interact_mode=InteractMode.TRANSMIT),
                             gap=Gap(d=focal_length))
    return seq_model.elements[-2:]




# Microscope specifications
object_distance = 8.4
objective_focal_length = 8
tube_length = 160
eyepiece_focal_length = 10

# Create the microscope system
microscope_system = create_microscope_system(object_distance, objective_focal_length, tube_length, eyepiece_focal_length)

# Print system details
print(microscope_system)

# Plot the system
layout_plt = plt.figure(FigureClass=InteractiveLayout, opt_model=microscope_system, do_draw_rays=True, do_paraxial_layout=False)
plt.show()
