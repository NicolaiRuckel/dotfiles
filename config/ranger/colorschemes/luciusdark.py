from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    cyan, magenta, red, white, default,
    normal, bold, reverse,
    default_colors,
)





class Luciusdark(ColorScheme):
    progress_bar_color = 117

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = 124
            if context.border:
                fg = default
            if context.media:
                if context.image:
                    fg = 130
                else:
                    fg = 90
            if context.container:
                fg = 124
            if context.directory:
                attr &= ~bold
                fg = 117
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr &= ~bold
                fg = 115
            if context.socket:
                fg = 90
                attr &= ~bold
            if context.fifo or context.device:
                fg = 130
                if context.device:
                    attr &= ~bold
            if context.link:
                fg = 30 if context.good else 90
            if context.tag_marker and not context.selected:
                attr &= ~bold
                if fg in (124, 90):
                    fg = 255
                else:
                    fg = 124
            if not context.selected and (context.cut or context.copied):
                fg = 238
                attr &= ~bold
            if context.main_column:
                if context.selected:
                    attr &= ~bold
                if context.marked:
                    attr &= ~bold
                    fg = 130
            if context.badinfo:
                if attr & reverse:
                    bg = 90
                else:
                    fg = 90

            if context.inactive_pane:
                fg = 30

        elif context.in_titlebar:
            attr &= ~bold
            if context.hostname:
                fg = 124 if context.bad else 115
            elif context.directory:
                fg = 117
            elif context.tab:
                if context.good:
                    bg = 115
            elif context.link:
                fg = 30

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 30
                elif context.bad:
                    fg = 90
            if context.marked:
                attr &= ~bold | reverse
                fg = 130
            if context.frozen:
                attr &= ~bold | reverse
                fg = 30
            if context.message:
                if context.bad:
                    attr &= ~bold
                    fg = 124
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 117
                attr &= ~bold
            if context.vcscommit:
                fg = 130
                attr &= ~bold
            if context.vcsdate:
                fg = 30
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 117

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 90
            # elif context.vcsuntracked:
            #     fg = 30
            elif context.vcschanged:
                fg = 124
            elif context.vcsunknown:
                fg = 124
            elif context.vcsstaged:
                fg = 115
            elif context.vcssync:
                fg = 115
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = 115
            elif context.vcsbehind:
                fg = 124
            elif context.vcsahead:
                fg = 117
            elif context.vcsdiverged:
                fg = 90
            elif context.vcsunknown:
                fg = 124

        return fg, bg, attr

#    background: '0x303030' 236
#    foreground: '0xeeeeee' 255
#    black:      '0x444444' 238
#    red:        '0xaf0000' 124
#    green:      '0x008700' 28
#    yellow:     '0xaf5f00' 130
#    blue:       '0x005faf' 25
#    magenta:    '0x870087' 90
#    cyan:       '0x008787' 30
#    white:      '0xeeeeee' 255
