STOW := $(shell command -v stow 2>/dev/null)
DNF := $(shell command -v dnf 2>/dev/null)

define stow-global-ignore
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

\.ci.*
\.vscode
\.idea.*
\.github.*
\.gitlab.*

# Go stuff
^/api
^/doc
^/pkg
^/test
^/src


^/README.*
^/LICENSE.*
^/COPYING
^/CONTRIBUTING.*
^/AGENTS.*
^/CLAUDE.*
^/codereview.*
^/CONTRIBUTING.*
^/PATENTS.*
^/SECURITY.*
^/VERSION.*
^/version.*
^/CODEOWNERS.*
^/CODE_OF_CONDUCT.*
^/PATENT.*
^/SECURITY.*
^/TESTOWNER.*
endef

.PHONY: stow-global-ignore-list
stow-global-ignore-list:
	$(file >$(HOME)/.stow-global-ignore,$(stow-global-ignore))

.PHONY: install-stow
install-stow:
ifdef STOW
	@echo Stow exists: $(STOW)
else
ifdef DNF
	$(DNF) install -y stow
else
	@echo Stow does not exist and there's no DNF. Install it.
	@false
endif
endif

.PHONY: stow-home unstow-home
stow-home: install-stow stow-global-ignore-list
	$(STOW) --stow homedir --target "$(HOME)"
unstow-home: install-stow
	$(STOW) --delete homedir --target "$(HOME)"


# Sources, staging and SDKs
TOOLS := $(HOME)/Tools
TOOLS_SOURCES := $(HOME)/Sources
TOOLS_STAGING := $(TOOLS)/Staging
TOOLS_SDKS := $(TOOLS)/SDKs

# Added to PATH
SYSTEM_INSTALL_PREFIX := /usr/local/my_tools

.PHONY: tools-stow
tools-stow:
	$(file >$(TOOLS_STAGING)/.stowrc,--target=$(SYSTEM_INSTALL_PREFIX))

tools:
	mkdir -p "$(TOOLS)" "$(TOOLS_SOURCES)" "$(TOOLS_STAGING)" "$(TOOLS_SDKS)"
	touch "$(TOOLS_STAGING)/.stow"
	${MAKE} tools-stow

UDEV_DIR := udev
USR_UDEV_RULES := /usr/lib/udev/rules.d
.PHONY: udev clean-udev
udev:
	$(foreach rule_file, $(wildcard $(UDEV_DIR)/*), ln -s $(realpath $(rule_file)) $(USR_UDEV_RULES)/)
clean-udev:
	$(foreach rule_file, $(wildcard $(UDEV_DIR)/*), rm -f $(USR_UDEV_RULES)/$(notdir $(rule_file)))

# Install rust via rustup
.PHONY: install-rust uninstall-rust
install-rust:
	$(eval install_sh := $(shell mktemp))
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > "$(install_sh)"
	chmod +x "$(install_sh)"
	"$(install_sh)" --yes --no-modify-path
	rm -f "$(install_sh)"

uninstall-rust:
	 rustup self uninstall --yes --no-modify-path

.PHONY: install-uv uninstall-uv
install-uv:
	$(eval install_sh := $(shell mktemp))
	@curl -LsSf https://astral.sh/uv/install.sh > "$(install_sh)"
	chmod +x "$(install_sh)"
	"$(install_sh)"
	rm -f "$(install_sh)"

uninstall-uv:
	uv cache clean
	rm -rf "$(shell uv python dir)"
	rm -rf "$(shell uv tool dir)"
	rm ~/.local/bin/uv ~/.local/bin/uvx
