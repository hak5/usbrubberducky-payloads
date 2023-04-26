try:
    import pygame
except:
    import os
    os.system("pip install pygame") 
    import pygame   
import random


pygame.init()

infoObject = pygame.display.Info()
screen_width = infoObject.current_w
screen_height = infoObject.current_h
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Python Prank!")

font = pygame.font.SysFont("Arial", 64)

while True:

    text_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
    text = font.render(":-) RUBBER DUCKS WILL TAKE OVER THE OCEANS! (-: )", True, text_color)

    x_offset = random.randint(-50, 50)
    y_offset = random.randint(-50, 50)
    text_rect = text.get_rect()
    text_rect.center = (screen_width//2 + x_offset, screen_height//2 + y_offset)

    screen.fill((0, 0, 0))
    screen.blit(text, text_rect)
    pygame.display.flip()