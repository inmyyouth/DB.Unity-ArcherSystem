using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;


public class SearchScore : MonoBehaviour
{
    public InputField archerIDField;

    public Button searchButton;
    public Text Arrow1;
    public Text Arrow2;
    public Text Arrow3;
    public Text Arrow4;
    public Text Arrow5;
    public Text Arrow6;
    public Text totalScore;

    public GameObject scorePanel;

    public void Start()
    {
        scorePanel.SetActive(false);
    }

    public void CallScore()
    {
        StartCoroutine(scoreView());
    }

    public void Quit()
    {
        Application.Quit();
    }

    public void GoToMainmenu()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene(0);
    }

    IEnumerator scoreView()
    {
        string url = "http://localhost/scoreView.php";
        WWWForm form = new WWWForm();
        form.AddField("archerID", archerIDField.text);
        UnityWebRequest www = UnityWebRequest.Post(url, form);

        yield return www.SendWebRequest();

        string rawresponse = www.downloadHandler.text;
        string[] users = rawresponse.Split('*');

        if (www.error == null)
        {
            Arrow1.text = users[0].ToString();
            Arrow2.text = users[1].ToString();
            Arrow3.text = users[2].ToString();
            Arrow4.text = users[3].ToString();
            Arrow5.text = users[4].ToString();
            Arrow6.text = users[5].ToString();
            totalScore.text = users[6].ToString();
            scorePanel.SetActive(true);
        }
        else
        {
            Debug.Log("Error");

        }
    }

    public void VerifyInputs()
    {
        searchButton.interactable = (archerIDField.text.Length >= 1);
    }
}
