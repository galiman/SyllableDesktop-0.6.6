OPTS   = -c --no-warn

EXE	= objs/alert

OBJDIR	:= objs


$(OBJDIR)/%.o : %.c
	$(CC) $(OPTS) $< -o $@

$(OBJDIR)/%.o : %.cpp
	@echo Compiling : $<
	@$(CXX) $(OPTS) $< -o $@


OBJS := ./objs/alert.o


$(EXE): objs $(OBJS)
	@echo Building : $(EXE)
	@$(CXX) $(OBJS) -lsyllable -o $(EXE)


$(OBJDIR):
	@echo Making $(OBJDIR) directory
	@mkdir objs
	
dist:
	@echo Coping $(EXE) to $(IMAGE)/system/bin/
	@cp -f objs/alert $(IMAGE)/system/bin/

clean:
	@echo Removing all objects and executable.
	@rm $(OBJS)
	@rm $(EXE)

