import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environmentSecret } from '../../environments/environment.secret';

@Injectable({
  providedIn: 'root'
})
export class TwitterClientService {

  private baseUrl: string = 'https://api.twitter.com/1.1';
  private userTimeLine: string = '/statuses/user_timeline'
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + environmentSecret.twitter.consumerAPIKey
    })
  }

  constructor(private http: HttpClient) { }

  getTweet(): Observable<any[]> {
    let param = new HttpParams();
    param.append('screen_name', 'neko3cs');

    return this.http
      .get<any[]>(
        `${this.baseUrl}${this.userTimeLine}?${param.toString()}`,
        this.httpOptions
      );
  }
}
