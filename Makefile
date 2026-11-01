# Added to PATH
SYSTEM_INSTALL_PREFIX := /usr/local/my_tools
USER_INSTALL_PREFIX := $(HOME)/.local

# Sources, staging and SDKs
TOOLS := $(HOME)/Tools
TOOLS_SOURCES := $(HOME)/Sources
TOOLS_STAGING := ${TOOLS}/Staging
TOOLS_SDKS := ${TOOLS}/SDKs

STOW := $(shell command -v stow 2>/dev/null)

.PHONY: install-stow
install-stow:
ifdef STOW
	@echo Stow exists: $(STOW)
else
	@echo Stow does not exist. Install it.
endif

.PHONY: stow-home
stow-home: install-stow
	$(STOW) --stow homedir --target "$(HOME)"

.PHONY: unstow-home
unstow-home: install-stow
	$(STOW) --delete homedir --target "$(HOME)"


define stow-ignore
RCS
.+,v

CVS
\.\#.+       # CVS conflict files / emacs lock files
\.cvsignore

\.svn
_darcs
\.hg

\.git
\.gitignore
\.gitmodules

.+~          # emacs backup files
\#.*\#       # emacs autosave files

^/README.*
^/LICENSE.*
^/COPYING
.*CONTRIBUTING.*
endef

.PHONY: tools
tools:
	mkdir -p "$(TOOLS)" "$(TOOLS_SOURCES)" "$(TOOLS_STAGING)" "$(TOOLS_SDKS)"
	touch "$(TOOLS_STAGING)/.stow"
	$(file >$(TOOLS_STAGING)/.stowrc,--target=$(SYSTEM_INSTALL_PREFIX))
	$(file >$(TOOLS_STAGING)/.stow-local-ignore,$(stow-ignore))
