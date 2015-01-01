# Maintainer: AdmiralAkber

pkgname='thinkpad-yoga-scripts-git'
_gitname='thinkpad-yoga-scripts'
pkgver=2015-01-01
pkgrel=1
pkgdesc='A collection of scripts and systemd services for tablet functionality of the ThinkPad Yoga'
url="https://github.com/admiralakber/thinkpad-yoga-scripts"
source=('thinkpad-yoga-scripts::git+https://github.com/admiralakber/thinkpad-yoga-scripts')
license=('GPL3')
arch=('any')
depends=('xorg-xrandr' 'acpid' 'xorg-xinput')
optdepends=(
	'onboard: onscreen keyboard'
	'xf86-input-wacom: for digitizer support'
	)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$_gitname

  # Disable touchpad when moving to tablet mode
  mkdir -p "$pkgdir/etc/acpi/events"
  install -m 644 tablet/tablet-mode "$pkgdir/etc/acpi/events"
  mkdir -p "$pkgdir/etc/acpi/actions"
  install -m 755 tablet/tablet-mode.sh "$pkgdir/etc/acpi/actions"

  # Other scripts into /opt
  mkdir -p "$pkgdir/opt/$_gitname"
  ## Rotate scripts
  cp -r rotate "$pkgdir/opt/$_gitname"
  ## Wacom scripts
  cp -r wacom "$pkgdir/opt/$_gitname"

  # ThinkPad Yoga Systemd Services
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  cp systemd/* "$pkgdir/usr/lib/systemd/system/*"

  # Install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}



