"""Supplementary scripts for graphics conversion."""

import os, re
import argparse

from pokemontools import gfx, lz


# Graphics with inverted tilemaps that aren't covered by filepath_rules.
pics = [
    'gfx/shrink1',
    'gfx/shrink2',
]

def recursive_read(filename):
    def recurse(filename_):
        lines = []
        for line in open(filename_):
            if 'include "' in line.lower():
                lines += recurse(line.split('"')[1])
            else:
                lines += [line]
        return lines
    lines = recurse(filename)
    return ''.join(lines)

base_stats = None
def get_base_stats():
    global base_stats
    if not base_stats:
        base_stats = recursive_read('data/pokemon/base_stats.asm')
    return base_stats

def get_pokemon_dimensions(name):
    try:
        if name == 'egg':
            return 5, 5
        if name == 'questionmark':
            return 7, 7
        if name.startswith('unown_'):
            name = 'unown'
        base_stats = get_base_stats()
        # hack for pidgeot/mew (previously caught by being substrings of pidgeotto/mewtwo)
        pattern = re.compile('\s+db {0}\s+'.format(name.upper()))
        start = pattern.search(base_stats).start()
        start = base_stats.find('\tdn ', start)
        end = base_stats.find('\n', start)
        line = base_stats[start:end].replace(',', ' ')
        w, h = map(int, line.split()[1:3])
        return w, h
    except:
        return 7, 7

def filepath_rules(filepath):
    """Infer attributes of certain graphics by their location in the filesystem."""
    args = {}

    filedir, filename = os.path.split(filepath)
    if filedir.startswith('./'):
        filedir = filedir[2:]

    name, ext = os.path.splitext(filename)
    if ext == '.lz':
        name, ext = os.path.splitext(name)

    pokemon_name = ''

    if 'gfx/pokemon/' in filedir:
        pokemon_name = filedir.split('/')[-1]
        if pokemon_name.startswith('unown_'):
            index = filedir.find(pokemon_name)
            if index != -1:
                filedir = filedir[:index + len('unown')] + filedir[index + len('unown_a'):]
        # startswith to handle front_gold / front_silver
        if name.startswith('front'):
            args['pal_file'] = os.path.join(filedir, 'normal.pal')
            args['pic'] = True
            # TODO: way to handle Crystal and Gold/Silver simultaneously?
            # args['animate'] = True
        # startswith to handle back_gold / back_silver
        elif name.startswith('back'):
            args['pal_file'] = os.path.join(filedir, 'shiny.pal')
            args['pic'] = True

    elif 'gfx/trainers' in filedir:
        trainer_name = filedir.split('/')[-1]
        args['pal_file'] = os.path.join(filedir, trainer_name + '.pal')
        args['pic'] = True

    elif 'gfx/mail' in filedir:
        px8 =  ['eon_mail_border_2', 'grass', 'lovely_mail_border', 'lovely_mail_underline',
                'morph_mail_border', 'morph_mail_divider', 'portrail_mail_border',
                'portraitmail_border', 'portraitmail_underline', 'small_heart', 'small_note',
                'small_pokeball', 'small_triangle', 'wave']
        px16 = ['eon_mail_border_1', 'flower_1', 'flower_2', 'large_circle', 'large_heart',
                'large_pokeball', 'large_triangle', 'morph_mail_corner',
                'music_mail_border', 'oddish', 'sentret', 'unused_grass']
        px24 = ['cloud', 'ditto', 'dratini', 'eevee', 'lapras',
                'mew', 'natu', 'poliwag']
        if name in px8:
            args['width'] = 8
        elif name in px16:
            args['width'] = 16
        elif name in px24:
            args['width'] = 24

        elif name == 'dragonite':
            args['width'] = 56
            args['rows'] = [(0, 6), (1, 6), (2, 6)]

        elif name == 'large_note':
            args['width'] = 16
            args['rows'] = [(1, 1), (0, 2)]

        elif name in ['surf_mail_border', 'flower_mail_border', 'litebluemail_border']:
            args['width'] = 24
            args['whitespace'] = [4]

    elif os.path.join(filedir, name) in pics:
        args['pic'] = True

    elif filedir == 'gfx/tilesets':
        args['tileset'] = True

    if args.get('pal_file'):
        if os.path.exists(args['pal_file']):
            args['palout'] = args['pal_file']
        else:
            del args['pal_file']

    if args.get('pic'):
        if ext == '.png':
            w, h = gfx.png.Reader(filepath).asRGBA8()[:2]
            w = min(w/8, h/8)
            args['pic_dimensions'] = w, w
        elif ext == '.2bpp':
            # startswith to handle front_gold / front_silver
            if pokemon_name and name.startswith('front'):
                w, h = get_pokemon_dimensions(pokemon_name)
                args['pic_dimensions'] = w, w
            # startswith to handle back_gold / back_silver
            elif pokemon_name and name.startswith('back'):
                args['pic_dimensions'] = 6, 6
            else:
                args['pic_dimensions'] = 7, 7

    if args.get('tileset'):
        args['width'] = 128
    return args


def to_1bpp(filename, **kwargs):
    name, ext = os.path.splitext(filename)
    if   ext == '.1bpp': pass
    elif ext == '.2bpp': gfx.export_2bpp_to_1bpp(filename, **kwargs)
    elif ext == '.png':  gfx.export_png_to_1bpp(filename, **kwargs)
    elif ext == '.lz':
        decompress(filename, **kwargs)
        to_1bpp(name, **kwargs)

def to_2bpp(filename, **kwargs):
    name, ext = os.path.splitext(filename)
    if   ext == '.1bpp': gfx.export_1bpp_to_2bpp(filename, **kwargs)
    elif ext == '.2bpp': pass
    elif ext == '.png':  gfx.export_png_to_2bpp(filename, **kwargs)
    elif ext == '.lz':
        decompress(filename, **kwargs)
        to_2bpp(name, **kwargs)

def to_png(filename, **kwargs):
    name, ext = os.path.splitext(filename)
    if   ext == '.1bpp': gfx.export_1bpp_to_png(filename, **kwargs)
    elif ext == '.2bpp': gfx.export_2bpp_to_png(filename, **kwargs)
    elif ext == '.png':  pass
    elif ext == '.lz':
        decompress(filename, **kwargs)
        to_png(name, **kwargs)

def compress(filename, **kwargs):
    data = open(filename, 'rb').read()
    lz_data = lz.Compressed(data).output
    open(filename + '.lz', 'wb').write(bytearray(lz_data))

def decompress(filename, **kwargs):
    lz_data = open(filename, 'rb').read()
    data = lz.Decompressed(lz_data).output
    # hack to work for Alakazam's silver backsprite; needs to be multiple of 8 anyway
    data = data[:len(data)//8*8]
    name, ext = os.path.splitext(filename)
    open(name, 'wb').write(bytearray(data))


methods = {
    '2bpp': to_2bpp,
    '1bpp': to_1bpp,
    'png':  to_png,
    'lz':   compress,
    'unlz': decompress,
}

def main(method_name, filenames=None):
    if filenames is None: filenames = []
    for filename in filenames:
        args = filepath_rules(filename)
        method = methods.get(method_name)
        if method:
            method(filename, **args)

def get_args():
    ap = argparse.ArgumentParser()
    ap.add_argument('method_name')
    ap.add_argument('filenames', nargs='*')
    args = ap.parse_args()
    return args

if __name__ == '__main__':
    main(**get_args().__dict__)
