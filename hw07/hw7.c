/**
 * @file hw7.c
 * @author Quincy Bright
 * @brief structs, pointers, pointer arithmetic, arrays, strings, and macros
 * @date 2021-11-03
 */

// DO NOT MODIFY THE INCLUDE(S) LIST
#include <stdio.h>
#include "hw7.h"
#include "my_string.h"

// Global array of pokemon structs
struct pokemon pokedex[MAX_POKEDEX_SIZE];

int size = 0;

/** catchPokemon
 *
 * @brief creates a new pokemon struct and adds it to the array of pokemon structs, "pokedex"
 *
 *
 * @param "nickname" nickname of the pokemon being created and added
 *               NOTE: if the length of the nickname (including the null terminating character)
 *               is above MAX_NICKNAME_SIZE, truncate nickname to MAX_NICKNAME_SIZE. If the length
 *               is below MIN_NICKNAME_SIZE, return FAILURE.  
 *               
 * @param "pokedexNumber" pokedexNumber of the pokemon being created and added
 * @param "powerLevel" power level of the pokemon being created and added
 * @param "speciesName" species name of the pokemon being created and added
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) "nickname" is less than MIN_NICKNAME_SIZE
 *         (2) a pokemon with the same already exits in the array "pokedex"
 *         (3) adding the new pokemon would cause the size of the array "pokedex" to
 *             exceed MAX_POKEDEX_SIZE
 */
int catchPokemon(const char *nickname, int pokedexNumber, double powerLevel, const char *speciesName)
{
   /* Note about UNUSED_PARAM
   *
   * UNUSED_PARAM is used to avoid compiler warnings and errors regarding unused function
   * parameters prior to implementing the function. Once you begin implementing this
   * function, you can delete the UNUSED_PARAM lines.
   */
  
  if (my_strlen(nickname) + 1 < MIN_NICKNAME_SIZE) {
    return FAILURE;
  }
  else if (size+1 > MAX_POKEDEX_SIZE) {
    return FAILURE;
  }
  else {
      for (int count = 0; count< size; count++) {
        if (my_strncmp(pokedex[count].nickname, nickname, my_strlen(nickname)+1) == 0) {
          return FAILURE;
        }
      }
    my_strncpy(pokedex[size].speciesName, speciesName, (size_t)(MAX_SPECIESNAME_SIZE-1));
    pokedex[size].pokedexNumber = pokedexNumber;
    pokedex[size].powerLevel = powerLevel;
    my_strncpy(pokedex[size].nickname, nickname, (size_t)(MAX_NICKNAME_SIZE-1));
    size++;
    return SUCCESS;
  }
  return FAILURE;
}

/** updatePokemonNickname
 *
 * @brief updates the nickname of an existing pokemon in the array of pokemon structs, "pokedex"
 *
 * @param "s" pokemon struct that exists in the array "pokedex"
 * @param "nickname" new nickname of pokemon "s"
 *               NOTE: if the length of nickname (including the null terminating character)
 *               is above MAX_NICKNAME_SIZE, truncate nickname to MAX_NICKNAME_SIZE
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) the pokemon struct "s" can not be found in the array "pokedex"
 */
int updatePokemonNickname(struct pokemon s, const char *nickname)
{
  for(int count = 0; count < size; count++) {
    if(my_strncmp(pokedex[count].nickname, s.nickname, my_strlen(s.nickname)+1) == 0) {
      my_strncpy(pokedex[count].nickname, nickname, (size_t)(MAX_NICKNAME_SIZE-1));
      return SUCCESS;
    }
  }

  return FAILURE;
}

/** swapPokemon
 *
 * @brief swaps the position of two pokemon structs in the array of pokemon structs, "pokedex"
 *
 * @param "index1" index of the first pokemon struct in the array "pokedex"
 * @param "index2" index of the second pokemon struct in the array "pokedex"
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) "index1" and/or "index2" are negative numbers
 *         (2) "index1" and/or "index2" are out of bounds of the array "pokedex"
 */
int swapPokemon(int index1, int index2)
{
  if (index1 < 0 || index2 < 0) {
      return FAILURE;
  }
  if (index1 >= size || index2 >= size) {
    return FAILURE;
  }
  struct pokemon temp;
  my_strncpy(temp.nickname, pokedex[index1].nickname, (size_t)(MAX_NICKNAME_SIZE - 1)); 
  my_strncpy(temp.speciesName, pokedex[index1].speciesName, (size_t)(MAX_SPECIESNAME_SIZE - 1));
  temp.powerLevel = pokedex[index1].powerLevel;
  temp.pokedexNumber = pokedex[index1].pokedexNumber;
  my_strncpy(pokedex[index1].nickname, pokedex[index2].nickname, (size_t)(MAX_NICKNAME_SIZE - 1));
  my_strncpy(pokedex[index1].speciesName, pokedex[index2].speciesName, (size_t)(MAX_SPECIESNAME_SIZE - 1));
  pokedex[index1].pokedexNumber = pokedex[index2].pokedexNumber;
  pokedex[index1].powerLevel = pokedex[index2].powerLevel;
  my_strncpy(pokedex[index2].nickname, temp.nickname, (size_t)(MAX_NICKNAME_SIZE - 1));
  my_strncpy(pokedex[index2].speciesName, temp.speciesName, (size_t)(MAX_SPECIESNAME_SIZE - 1));
  pokedex[index2].pokedexNumber = temp.pokedexNumber;
  pokedex[index2].powerLevel = temp.powerLevel;

  return SUCCESS;
}

/** releasePokemon
 *
 * @brief removes pokemon in the array of pokemon structs, "pokedex", that has the same nickname
 *
 * @param "s" pokemon struct that exists in the array "pokedex"
 * @return FAILURE on failure, SUCCESS on success
 *         Failure if any of the following are true:
 *         (1) the pokemon struct "s" can not be found in the array "pokedex"
 */
int releasePokemon(struct pokemon s)
{
  for(int count = 0; count < size; count++) {
    if (my_strncmp(pokedex[count].nickname, s.nickname, my_strlen(s.nickname)+1) == 0) {
      for (int count2 = count+1; count2 < size; count2++) {
        swapPokemon(count2-1,count2);
      }
      size--;
      return SUCCESS;
    }
  }

  return FAILURE;
}

/** comparePokemon
 *
 * @brief compares the two pokemons' pokedex number and names (using ASCII)
 *
 * @param "s1" pokemon struct that exists in the array "pokedex"
 * @param "s2" pokemon struct that exists in the array "pokedex"
 * @return negative number if s1 is less than s2, positive number if s1 is greater
 *         than s2, and 0 if s1 is equal to s2
 */
int comparePokemon(struct pokemon s1, struct pokemon s2)
{
  if (s1.pokedexNumber < s2.pokedexNumber) {
    return -1;
  }
  if (s1.pokedexNumber > s2.pokedexNumber) {
    return 1;
  }
  else {
    return my_strncmp(s1.nickname, s2.nickname, (size_t)(MAX_NICKNAME_SIZE-1));
  }

}

/** sortPokemon
 *
 * @brief using the comparePokemon function, sort the pokemons in the array of
 * pokemon structs, "pokedex," by the pokedex number and nicknames
 *
 * @param void
 * @return void
 */
void sortPokemon(void)
{
  int i, j;
  int n = size-1;
  for (i = 0; i < n; i++){
    for (j=0; j<n; j++) {
      if (comparePokemon(pokedex[j],pokedex[j+1]) > 0) {
        swapPokemon(j,j+1);
      }
    }
  }
}