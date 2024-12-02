using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Mainmenu : MonoBehaviour
{
    public void GoToRegister() {
        UnityEngine.SceneManagement.SceneManager.LoadScene(1);
    }

    public void GoToScore()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene(2);
    }
}
