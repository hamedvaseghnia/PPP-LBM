# Define the compiler
FC = gfortran

# Define the flags for the compiler
# -O2 for optimization, -fopenmp for OpenMP support
FFLAGS = -O2 -fopenmp

SRCDIR = src

OBJS = $(addprefix $(SRCDIR)/, Variables.o Memory_allocation.o Initialization.o BGK_collision.o Streaming.o Macroscopic.o External_Force.o EquilibriumDF.o OutputFile.o Geometry.o Wall_Boundary.o LBM.o)

TARGET = run

all: $(TARGET)

$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^
$(SRCDIR)/%.o: $(SRCDIR)/%.f90
	$(FC) $(FFLAGS) -c $< -o $@

$(SRCDIR)/LBM.o: $(SRCDIR)/LBM.f90 $(OBJS)
	$(FC) $(FFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
