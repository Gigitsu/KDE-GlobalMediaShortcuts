pkgname=g2gms
pkgrel=1
pkgver=1
pkgdesc="Global media shortcuts usin Media Player Remote Interfacing Specification"
arch=('any')
license=('custom')
depends=('bash')
source=("g2gms.sh")
md5sums=('9a044efae53937422df97bb1f2d5c90c')

package() {
	install -D -m 755 "${srcdir}/g2gms.sh" "${pkgdir}/usr/bin/g2gms"
}