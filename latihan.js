class burung {
    constructor(name) {
        this.name = name;
    }
    bersuara() {
        console.log(`${this.name} Burung berkicau`);
    }
}

class ayam extends burung {
    constructor(name) {
        super(name);
    }
    bersuara() {
        console.log(`${this.name} berkokok`);
    }
}

class bebek extends burung {
    constructor(name) {
        super(name);
    }
    bersuara() {
        console.log(`${this.name} menguak`);
    }
}

const daftarburung = [new ayam("Ayam"), new bebek("Bebek")];

daftarburung.forEach(burung => burung.bersuara());

class matematika{
static pi = 3.13159;

static luasLingkaran(jari){
    return this.pi * jari * jari;
}
}
console.log(matematika.luasLingkaran(10));

class mahasiswa{
    #nama;
    constructor(nama) {
        this.#nama = nama;
    }

    get nama() {
        return this.#nama.toUpperCase();
    }

    set nama(value) {
if (value.length < 3) {
            console.log(`Nama terlalu pendek`);
        }
        this.#nama = value;
    }

}

const mhs = new mahasiswa("Budi");
console.log(mhs.nama);
mhs.nama = "Jo";
mhs.nama = "putri";
console.log(mhs.nama);